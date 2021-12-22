const express = require("express");
const app = express();
const path = require("path");
const mysql = require("mysql");
var Connection = require("mysql/lib/Connection");
const { query } = require("express");
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
  const query = await connection.query(
    `select * from Employee`,
    (error, results) => {
      if (error) res.send("error first query");
      else {
        queryResult.synonyme = results;

        connection.query(`select * from Department`, (error, results) => {
          if (error) res.send("error second query");
          else {
            queryResult.Phonetics = results;
            res.send(queryResult);
          }
        });
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
