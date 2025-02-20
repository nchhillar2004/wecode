import {Link} from "react-router-dom";

export default function ErrorRoute(){
    return (
        <div>
            <h1 style={{color: "blue", background: "yellow"}}>Page not found: 404</h1>
            <h2 style={{color: "red", background: "lightgreen"}}>Sorry! we cannot find the page you are looking for.</h2>
            <h4 style={{margin: "0px"}}>Try these links:</h4>
            <ul style={{listStyle: "none", lineHeight: "22px"}}>
                <li><Link to="/" end>Home page</Link></li>
                <li><Link to="/challenges" end>Challenges</Link></li>
                <li><Link to="/servers" end>Servers</Link></li>
                <li><Link to="/about" end>About us</Link></li>
                <li><Link to="/" end>Help & support</Link></li>
            </ul>
        </div>
    );
}
