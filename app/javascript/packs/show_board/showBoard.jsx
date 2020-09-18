import React, { useState } from "react";
import ReactDOM from "react-dom";
import BoardTable from "./boardTable";

const ShowBoard = () => {
  return (
    <>
      <h2>Board: @board.title </h2>
      <h6>Status: @board.status </h6>
      <p>Description: @board.description </p>
      <BoardTable />
    </>
  );
};

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <ShowBoard />,
    document.querySelector("section.display-container")
  );
});
