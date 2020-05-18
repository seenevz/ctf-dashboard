import React from 'react'

const FlagInput = ({ index, flag, changeFlag, removeFlag }) => {
    const flagId = `flag-${index}`
    
    return (
        <>
            <label htmlFor={flagId}>{" |> ( "}{index + 1}{" ) |> "}</label>
            <input 
                id={flagId}
                type="text"
                value={flag}
                onChange={(e) => changeFlag(e.target.value, index)}
            />
            <button onClick={(e) => {
                e.preventDefault()
                removeFlag(index)
            }}>X</button>
            <br/>
        </>
    )
}

export default FlagInput
