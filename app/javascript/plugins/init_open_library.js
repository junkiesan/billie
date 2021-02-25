
// const convertTitle = (query) => {
//   fetch(`https://openlibrary.org/search.json?q=${query}`)
//     .then(response => response.json())
//     .then(insertBooks);
//     console.log(data);
// };

const list = document.querySelector(".list-books");

const insertBooks = (data) => {
  data.docs.forEach((result) => {
    const book = `<li>
      <p>${result.title}</p>
      <p>${result.author_name}</p>
    </li>`;
    list.insertAdjacentHTML('beforeend', book);
  });
};


const fetchBooks = (query) => {
  fetch(`https://openlibrary.org/search.json?q=naruto`)
    .then(response => response.json())
    .then(insertBooks);
};

export { fetchBooks };


// https://openlibrary.org/search?title=${query}
