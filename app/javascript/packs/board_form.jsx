// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { useState } from 'react';
import ReactDOM from 'react-dom'

import FlagInput from './flag_input'

const BoardForm = () => {
  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const [flags, setFlags] = useState([''])

  const addFlag = (e) => {
    e.preventDefault()
    
    setFlags([...flags, ''])
  }
  
  const changeFlag = (newFlag, index) => {
    const updatedFlags = [...flags]
    updatedFlags[index] = newFlag
    setFlags(updatedFlags)
  }

  const removeFlag = (index) => {
    const updatedFlags = [...flags]
    updatedFlags.splice(index, 1)
    setFlags(updatedFlags)
  }
  
  return (
    <form className="board-form">
      <label htmlFor="title">Title</label>
      <input
        id="title"
        type="text"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />
      <br/>

      <label htmlFor="description">Description</label>
      <input
        id="description"
        type="textaread"
        value={description}
        onChange={(e) => setDescription(e.target.value)}
      />
      <br/>

      <hr/>
      <h4>Flags</h4>
      <button onClick={addFlag}>+</button>
      <br/>

      {
        flags.map((flag, index) =>
          <FlagInput
            key={index}
            index={index}
            flag={flag}
            changeFlag={changeFlag}
            removeFlag={removeFlag}
          />
        )
      }
      
      <input type="submit"/>
    </form>
  );
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <BoardForm />,
    document.querySelector('section.display-container').appendChild(document.createElement('div')),
  )
})
