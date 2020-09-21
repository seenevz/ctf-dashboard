import React, { useState } from "react";
import ReactDOM from "react-dom";
import BoardTable from "./boardTable";
import API from '../APIRequests'

const ShowBoard = ({ data: { board, current_user } }) => {
  const status = board => {
    switch (true) {
      case board.published:
        return "Published";
      case board.completed:
        return "Completed";
      case board.user_id === current_user.id:
        return "Draft";
    }
  };
  return (
    <>
      <h2>Board: {`${board.title}`}</h2>
      <h3>Status: {`${status(board)}`}</h3>
      <h4>Description: {`${board.description || 'No description'}`}</h4>
      <BoardTable board_id={board.id}/>
    </>
  );
};

document.addEventListener("DOMContentLoaded", () => {
  const dataTag = document.querySelector("#data");
  const data = JSON.parse(dataTag.getAttribute("data"));

  ReactDOM.render(
    <ShowBoard data={data} />,
    document.querySelector("section.display-container")
  );
});
