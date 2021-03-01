const list = document.querySelector(".list-books");

const insertGoogleBooks = (data) => {
  console.log(data);
  data.items.forEach((result) => {
    const google_book = `<li>
      <h2>${result.volumeInfo.title}</h2>
      <p>${result.volumeInfo.authors[0]}</p>
      <p>${result.volumeInfo.publisher}</p>
      <br>
      <p>${result.volumeInfo.description}</p>
    </li>`;
    list.insertAdjacentHTML('beforeend', google_book);
  });
};


const fetchGoogleBooks = (query) => {
  fetch(`https://www.googleapis.com/books/v1/volumes?q=harrypotter`)
    .then(response => response.json())
    .then(insertGoogleBooks);
};

export { fetchGoogleBooks };


// &maxResults=15&key=#{ENV["API_KEY"]}

