interface NotificationType{
    message: string;
    code: string;
}

export default function Notification({message, code}: NotificationType){
    return(
        <p style={{color: "yellow", margin: "0px", background: "red"}}>{message}{": "}{code}</p>
    );
}
