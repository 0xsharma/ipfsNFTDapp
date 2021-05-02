import React from 'react'
import './navBar.css';
import {Link} from 'react-router-dom'

function NavBar() {
    return (
        <div>
            <nav>
                <h3>
                    Polygon 
                </h3>
                <ul className="nav-links">
                    <Link to='./createPolyNft'>
                    <li>
                        Create Poly
                    </li>
                    </Link>
                    <Link to='./buyPolyNft'>
                    <li>
                        Buy Poly
                    </li>
                    </Link>
                </ul>
            </nav>
        </div>
    )
}

export default NavBar
