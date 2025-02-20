import {useEffect, useState} from "preact/hooks";
import {useTheme} from "../../context/ThemeContextProvider"

export default function ToggleTheme(){
    const {theme, setTheme} = useTheme();
    const [mounted, setMounted] = useState(false);

    useEffect(() => {
        setMounted(true);
    }, []);

    return (
        <>
            {mounted ?
                <select value={theme} onChange={(e) => setTheme(e.target.value)}>
                    <option value={"light"}>Light</option>
                    <option value={"dark"}>Dark</option>
                </select> : <p>loading..</p>}
        </>
    )
}
