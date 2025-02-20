import {Outlet} from "react-router-dom";
import GlobalFooter from "../components/GlobalFooter";
import GlobalHeader from "../components/GlobalHeader";

export default function GlobalLayout(){
    return(
        <>
            <GlobalHeader/>
                <Outlet/>
            <GlobalFooter/>
        </>
    );
}
