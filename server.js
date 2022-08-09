const express = require("express");
const app = express();
const path = require("path");
const mysql = require("mysql");
var Connection = require("mysql/lib/Connection");
const db_config = {
  host: "bdwyaxuoiy38wddwtdxs-mysql.services.clever-cloud.com",
  database: "bdwyaxuoiy38wddwtdxs",
  user: "uewldxfzpbauu3nf",
  password: "vTJ5cQWE1Wv9aRo0z0ZT",
  waitForConnections: true,
  connectionLimit: 10,
};
let connection;
handleDisconnect();

const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log(`app listening at http://localhost:${port}`);
});

//middlewares
app.use(express.static("public"));

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "public/PhoneticsScience.html"));
});

app.get("/word/:word", async (req, res) => {
  const word = req.params.word;
  const queryResult = {};
  connection.query(
    `select w.word as "synonym", w.defenition as "defenition",t.word_type as "type" from WORD
    join WORD_type on WORD.word_type = WORD_type.type_ID
    join synonyms s on WORD.word_ID = s.W_ID
    join WORD w on s.Syn_ID = w.word_ID
    join WORD_type t on w.word_type = t.type_ID
    where WORD.word = "${word}";`,
    (error, results) => {
      if (error) res.sendStatus(501);
      else {
        queryResult.synonyms = results;

        connection.query(
          `select w.word as "homophone", w.defenition as "defenition", t.word_type as "type" from WORD
          join WORD_type on WORD.word_type = WORD_type.type_ID
          join phonesthetics p on WORD.word_ID = p.W1_ID
          join WORD w on p.W2_ID = w.word_ID
          join WORD_type t on w.word_type = t.type_ID
          where WORD.word = "${word}";`,
          (error, results) => {
            if (error) res.sendStatus(500);
            else {
              queryResult.homophones = results;
              res.send(queryResult);
            }
          }
        );
      }
    }
  );
});

function handleDisconnect() {
  connection = mysql.createConnection(db_config); // Recreate the connection, since
  // the old one cannot be reused.

  connection.connect(function (err) {
    // The server is either down
    if (err) {
      // or restarting (takes a while sometimes).
      console.log("error when connecting to db:", err);
      setTimeout(handleDisconnect, 3000); // We introduce a delay before attempting to reconnect,
    } // to avoid a hot loop, and to allow our node script to
  }); // process asynchronous requests in the meantime.
  // If you're also serving http, display a 503 error.
  connection.on("error", function (err) {
    console.log("db error", err);
    if (err.code === "PROTOCOL_CONNECTION_LOST") {
      // Connection to the MySQL server is usually
      handleDisconnect(); // lost due to either server restart, or a
    } else {
      // connnection idle timeout (the wait_timeout
      throw err; // server variable configures this)
    }
  });
}
