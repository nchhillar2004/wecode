import { ThemeContextProvider } from './context/ThemeContextProvider';
import ToggleTheme from './components/commons/ToggleTheme';
import { AuthContextProvider } from './context/AuthContextProvider';
import { Routes, Route } from 'react-router-dom';
import ErrorRoute from './routes/ErrorRoute';
import AboutRoute from './routes/AboutRoute';
import GlobalLayout from './routes/GlobalLayout';
import HomeRoute from './routes/home/HomeRoute';
import AuthLayout from './routes/auth/AuthLayout';
import LoginRoute from './routes/auth/LoginRoute';
import RegisterRoute from './routes/auth/RegisterRoute';
import AuthIndex from './routes/auth/AuthIndex';
import ChallengesLayout from './routes/challenges/ChallengesLayout';
import ChallengesList from './routes/challenges/ChallengesList';
import QuestionRoute from './routes/challenges/QuestionRoute';
import Notification from './components/Notification';

export function App() {
    return (
        <ThemeContextProvider>
            <AuthContextProvider>
                <main>
                    <Notification message='Internal server error' code='503'/>
                    <Routes>
                        <Route path='/' element={<GlobalLayout/>}>
                            <Route index element={<HomeRoute/>} />
                            <Route path='about' element={<AboutRoute/>} />
                            <Route path='challenges' element={<ChallengesLayout/>}>
                                <Route index element={<ChallengesList/>} />
                                <Route path=':quesId' element={<QuestionRoute/>} />
                            </Route>
                        </Route>
                        <Route path='auth' element={<AuthLayout/>}>
                            <Route index element={<AuthIndex/>} />
                            <Route path='login' element={<LoginRoute/>} />
                            <Route path='register' element={<RegisterRoute/>} />
                        </Route>
                        <Route path='*' element={<ErrorRoute/>}/>
                    </Routes>
                </main>
            </AuthContextProvider>
        </ThemeContextProvider>
    );
}
