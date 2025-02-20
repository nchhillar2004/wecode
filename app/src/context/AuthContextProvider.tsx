import { createContext, ComponentChildren } from "preact";
import { useState, useEffect, useContext } from "preact/hooks";

interface AuthContextType{
    isAuthenticated: boolean;
    privilages: "admin" | "verified" | "member" | "visitor";
}

const AuthContext = createContext<AuthContextType>({
    isAuthenticated: false,
    privilages: "visitor",
});

function AuthContextProvider({children}: {children: ComponentChildren}) {
    const [isAuthenticated, setIsAuthenticated] = useState(false);
    const [privilages, setPrivilages] = useState("visitor");

    useEffect(() => {
        setIsAuthenticated(isAuthenticated);
        setPrivilages(privilages);
    }, [isAuthenticated, privilages]);

    return(
        <AuthContext.Provider value={{isAuthenticated, setIsAuthenticated, privilages, setPrivilages}}>
            {children}
        </AuthContext.Provider>
    );
}

function useAuth(){
    return useContext(AuthContext);
}

export {AuthContext, AuthContextProvider, useAuth};
