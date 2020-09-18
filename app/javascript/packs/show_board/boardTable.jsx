import React, { useState } from "react";

const BoardTable = () => {
  return (
    <table className="user-boards-table">
      <thead>
        <tr>
          <th>Title</th>
          <th>Published?</th>
        </tr>
      </thead>
    </table>
  );
};

export default BoardTable;
