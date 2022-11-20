const userName = localStorage.getItem("name");

// if (userName === null) {
//   window.location = "form.html";
// }
let addUserName;

const addItem = (ev) => {
  ev.preventDefult();
  addUserName = document.getElementById(".fname").value;
};

document.getElementById(".fname").addEventListener("click", addItem);

console.log(addUserName);
const add = window.localStorage.setItem("name", addUserName);

const take = window.localStorage.getItem("name");
console.log(take);

// ---------------------------------------

const grabBtn = document.getElementById("grabBtn");
grabBtn.addEventListener("click", () => {
  // Get active browser tab
  chrome.tabs.query({ active: true }, function (tabs) {
    var tab = tabs[0];
    if (tab) {
      execScript(tab);
    } else {
      alert("There are no active tabs");
    }
  });
});

/**
 * Function executes a grabImages() function on a web page,
 * opened on specified tab
 * @param tab - A tab to execute script on
 */
function execScript(tab) {
  // Execute a function on a page of the current browser tab
  // and process the result of execution
  chrome.scripting.executeScript(
    {
      target: { tabId: tab.id, allFrames: true },
      func: grabImages,
    },
    onResult
  );
}
