import React from 'react'
import './navBar.css';

function buyPolyNft() {
    return (
        <div>
            <div className="formSubmit">
            <h1>Welcome To Buy NFT</h1>
            <form>
                <label>
                    Enter Token: <input type="Input" name="name" />
                </label>
                <input type="submit" value="Submit" />
            </form>
            </div>
        </div>
    )
}

export default buyPolyNft
