import React from "react";

const FlagInput = ({ index, flag, changeFlag, removeFlag }) => {
  const flagId = `flag-${index}`;

  const numeration = index => {
    const pos = ++index;
    let lastDigit = pos;

    if (pos > 20) {
      lastDigit = parseInt(pos.toString().slice(-1));
    }

    switch (lastDigit) {
      case 1:
        return `${pos}st`;
      case 2:
        return `${pos}nd`;
      case 3:
        return `${pos}rd`;
      default:
        return `${pos}th`;
    }
  };

  return (
    <>
      <label htmlFor={flagId}>
        {" |> ( "}
        {numeration(index)}
        {" ) |> "}
      </label>
      <input
        id={flagId}
        type="text"
        value={flag}
        placeholder="Flag value goes here"
        onChange={e => changeFlag(e.target.value, index)}
      />
      <button
        onClick={e => {
          e.preventDefault();
          removeFlag(index);
        }}
      >
        X
      </button>
      <br />
    </>
  );
};

export default FlagInput;
