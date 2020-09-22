import React, { useEffect, useState } from "react";
import TableFlag from "./tableFlag";

import req from "../APIRequests";

const BoardTable = ({ board_id }) => {
  const [flags, setFlags] = useState([]);

  useEffect(() => {
    (async () => {
      const resp = await req.getFlagsForBoard(board_id);

      setFlags(resp);
    })();
  }, []);

  return (
    <table className="user-boards-table">
      <thead>
        <tr>
          <th>Level</th>
        </tr>
      </thead>
      <tbody>
        {flags.map(flag => (
          <TableFlag key={flag.id}/>
        ))}
      </tbody>
    </table>
  );
};

export default BoardTable;
