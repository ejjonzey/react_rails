import React, { Component } from 'react';
import axios from 'axios';

class AllArtists extends Component {
    constructor(){
        super();
        this.state = {
            error: '',
            artists:[]
        }
    }

    componentWillMount(){
    this._fetchArtists();
    }

    
    _fetchArtists = async ()=>{
        try{
            const res = await axios.get('/api/artists');
            const artists = res.data;
            this.setState({artists})
        }catch(err){
            this.setState({error: err})
        }
    }

        

    
    render() {
        return (
            <div>
              <h1>Hello from all artists</h1>  
            </div>
        );
    }
}

export default AllArtists;