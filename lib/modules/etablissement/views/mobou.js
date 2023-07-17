let _lismedocs = [
  "para medi 150",
  "dolipranre pv 301",
  "rey medi 150",
  "iu pv 301",
];

function filter(_listToSearch, key) {
  let listResult = [];
  // fonction de filtrage qui return une liste
  return listResult;
}
let search = "para medi";
function searchmedocs(search) {
  let cle = search.split(" ");

  let listFinal = [];
  listFinal = _lismedocs;
  for (let index = 0; index < cle.length; index++) {
    let key = cle[index];
    listFinal = filter(listFinal, key);
  }
  return listFinal;
}
 