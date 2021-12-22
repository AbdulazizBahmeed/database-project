const input = document.getElementById("word-input");
input.addEventListener("input", () => {
    input.style.borderColor = "";
  });


const search = document.getElementById("search-button");
input.onkeydown = (e) => {
    if (e.code == "Enter" || e.code == "NumpadEnter" || e.keyCode == "13") search.onclick();
  };
search.onclick = () => {
  const value = input.value;
  if (value !== ""){
    //TODO: inserting records values
  } else {
    input.style.borderColor = "red";
    input.classList = "invalid-input";
    setTimeout(() => {
        input.classList = "";
    }, 500);
  }
};