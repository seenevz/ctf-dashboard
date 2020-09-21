import React, { useState } from "react";
import TableFlag from "./tableFlag";

const BoardTable = ({board_id}) => {
  const [flags, setFlags] = useState([])

  return (
    <table className="user-boards-table">
      <thead>
        <tr>
          <th>Title</th>
          <th>Published?</th>
        </tr>
      </thead>
      <tbody>
        <TableFlag/>
      </tbody>
    </table>
  );
};

export default BoardTable;
