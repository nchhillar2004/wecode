import {Link} from "react-router-dom";

export default function AuthIndex(){
    return(
        <div>
            <p>get started by creating an account <Link to='/regsiter' end className='link'>here</Link>.</p>
            <p>OR get back to your account by <Link to='/login' end className='link'>logging in</Link>.</p>
            <p>Return to <Link to='/' end className='link'>home page</Link></p>
        </div>
    );
}

