const BASE_URL = 'http://127.0.0.1:3000'

const csrfToken = () => document.querySelector("meta[name='csrf-token']").getAttribute("content")

const createBoard = (board) => {
    return compactFetch('/b', {
        method: 'POST',
        headers: { 'X-CSRF-Token': csrfToken() },
        body: board,
    })
}

// PRIVATE FUNCTIONS
const compactFetch = (urlExtension, { method, headers, body }) => {
    const options = {
        method,
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            ...headers,
        },
        body: JSON.stringify(body),
    }

    debugger
    
    return fetch(urlExtension, options)
    .then( parseJson )
}

const parseJson = (req) => {
    debugger
    if (req.ok) {
        return req.json()
    } else {
        throw req.json()
    }
}

export default {
    createBoard,
}