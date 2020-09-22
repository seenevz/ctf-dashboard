// PRIVATE FUNCTIONS
const csrfToken = () =>
  document.querySelector("meta[name='csrf-token']").getAttribute("content");

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

// Exported requests

const createBoard = board => {
  return compactFetch("/b", {
    method: "POST",
    body: board,
  });
};

const getFlagsForBoard = boardId => {
  return compactFetch("/b/flags/" + boardId, { method: "GET" });
};

export default {
  createBoard,
  getFlagsForBoard,
};
