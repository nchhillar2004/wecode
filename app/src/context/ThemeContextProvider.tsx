import { ComponentChildren } from "preact";
import { createContext } from "preact";
import { useContext, useEffect, useState } from "preact/hooks";

interface ThemeContextType{
    theme: "light" | "dark";
    setTheme: (theme: "light" | "dark") => void;
}

const ThemeContext = createContext<ThemeContextType>({
    theme: "dark",
    setTheme: () => {},
});

function ThemeContextProvider({children}: {children: ComponentChildren}){
    const localTheme = localStorage.getItem("theme");
    const [theme, setTheme] = useState<"light" | "dark">(localTheme!=null ? localTheme : "dark");

    useEffect(() => {
        document.documentElement.setAttribute('data-theme', theme);
        setTheme(theme);
        localStorage.setItem("theme", theme);
    }, [theme]);

    return(
    <ThemeContext.Provider value={{ theme, setTheme }}>{children}</ThemeContext.Provider>
    );
}

function useTheme(){
    return useContext(ThemeContext);
}

export {ThemeContext, ThemeContextProvider, useTheme};
