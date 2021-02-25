const fetchBooks = (query) => {
  fetch(`https://openlibrary.org/`)
    .then(response => response.json())
    .then(insertBooks);
};

export { fetchBooks };
