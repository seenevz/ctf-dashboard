const BASE_URL = "http://127.0.0.1:3000";

const csrfToken = () =>
  document.querySelector("meta[name='csrf-token']").getAttribute("content");

const createBoard = board => {
  return compactFetch("/b", {
    method: "POST",
    body: board,
  });
};

// PRIVATE FUNCTIONS
const compactFetch = (urlExtension, { method, headers, body }) => {
  const options = {
    method,
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json",
      "X-CSRF-Token": csrfToken(),
      ...headers,
    },
    body: JSON.stringify(body),
  };

  return fetch(urlExtension, options).then(parseJson);
};

const parseJson = req => {
  if (req.ok) {
    return req.json();
  } else {
    throw req.json();
  }
};

export default {
  createBoard,
};
