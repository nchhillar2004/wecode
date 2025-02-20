import {Link, NavLink} from "react-router-dom";
import ToggleTheme from "./commons/ToggleTheme";

export default function GlobalHeader(){
    return(
        <header>
            <nav style={{display: "flex", alignItems: "center", justifyContent: "space-between"}}>
                <Link to="/" end><h1 style={{margin: "4px"}}>WeCode</h1></Link>
                <div>
                    <Link to="/about" end>About</Link>
                    <Link to="/challenges" end>Challenges</Link>
                    <Link to="/servers" end>Servers</Link>
                    <Link to="/help" end>Help</Link>
                </div>
                <ToggleTheme/>
            </nav>
        </header>
    );
}
