const input = document.getElementById("word-input");
input.addEventListener("input", () => {
  input.style.borderColor = "";
});

const search = document.getElementById("search-button");
input.onkeydown = (e) => {
  if (e.code == "Enter" || e.code == "NumpadEnter" || e.keyCode == "13")
    search.onclick();
};
search.onclick = () => {
  const value = input.value;
  if (value !== "") {
    //TODO: inserting records values
    query(value);
  } else {
    input.style.borderColor = "red";
    input.classList = "invalid-input";
    setTimeout(() => {
      input.classList = "";
    }, 500);
  }
};

async function query(word) {
  const query = await fetch(`/word/${word}`);
  const synonemTable = document.getElementById("synonym_table");
  synonemTable.innerHTML = `<thead>
  <th>#</th>
  <th>synonyme</th>
  <th>difintion</th>
  <th>type</th>
</thead>`;

  const homophoneTable = document.getElementById("homophone_table");
  homophoneTable.innerHTML = `<thead>
  <th>#</th>
  <th>HOMOPHONE</th>
  <th>difintion</th>
  <th>type</th>
</thead>`;

  if (query.ok) {
    const result = await query.json();
    const synonyms = await result.synonyms;
    const homophones = await result.homophones;

    // synonyms for loop
    for (let i = 0; i < synonyms.length; i++) {
      const word = synonyms[i];
      var row = synonemTable.insertRow();

      const number = row.insertCell();
      number.innerText = i + 1; //the number
      const synonym = row.insertCell();
      synonym.innerText = word.synonym; //the word
      const defenition = row.insertCell();
      defenition.innerText = word.defenition; // word defenition
      const type = row.insertCell();
      type.innerText = word.type; // word type

      synonemTable.appendChild(row);
    }

    // homophone for loop
    const homophoneTable = document.getElementById("homophone_table");
    for (let i = 0; i < homophones.length; i++) {
      const word = homophones[i];

      var row = homophoneTable.insertRow();
      const number = row.insertCell();
      number.innerText = i + 1; //the number
      const synonym = row.insertCell();
      synonym.innerText = word.homophone; //the word
      const defenition = row.insertCell();
      defenition.innerText = word.defenition; // word defenition
      const type = row.insertCell();
      type.innerText = word.type; // word type

      homophoneTable.appendChild(row);
    }
  }
}
