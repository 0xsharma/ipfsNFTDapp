import './App.css';
import NavBar from './components/NavBar/NavBar'
import {BrowserRouter as Router, Switch, Route} from 'react-router-dom'
import createPolyNft from './components/NavBar/createPolyNft';
import buyPolyNft from './components/NavBar/buyPolyNft';

function App() {
  return (
    <div className="App">
      <Router>
        <div className = "App">
          <NavBar/>
          <Switch>
            <Route path="/" exact component = {Home}/>
            <Route path="/createPolyNFT" exact component = {createPolyNft}/>
            <Route path="/buyPolyNFT" exact component = {buyPolyNft}/>
          </Switch>
        </div>
      </Router>
    </div>
  );
}

const Home = () => (
    <div>
      <h1>Welcome to PoLygon</h1>
    </div>
);

export default App;
