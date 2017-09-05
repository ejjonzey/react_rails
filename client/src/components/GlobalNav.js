import React, { Component } from 'react';
import {Link} from 'react-router-dom';

class GlobalNav extends Component {
    render() {
        return (
        <div>
        <Link to="/">
        <h1>Tunr</h1>
        </Link>
        <div>
        <Link to="/artists/1">Artists</Link>
        <Link to="/signup">Sign Up!</Link>
        </div>
        </div>
        );
    }
}

export default GlobalNav;