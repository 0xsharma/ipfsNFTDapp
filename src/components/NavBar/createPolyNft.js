import React from 'react'
import './navBar.css';

function createPolyNft() {
    return (
        <div>
            <div className="formSubmit">
            <h1>Welcome To Create Polygon</h1>
            <form>
                <label>
                    Upload File: <input type="file" name="name" />
                </label>
                <input type="submit" value="Submit" />
            </form>
            </div>
        </div>
    )
}

export default createPolyNft
