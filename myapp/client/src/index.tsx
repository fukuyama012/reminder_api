import * as React from "react";
import * as ReactDOM from "react-dom";
import axios from "axios";

class Category extends React.Component<any, any> {
    constructor(props) {
        super(props);
        this.state = {
            info: []
        }
    }

    category = () => {
        axios.get('/api/v1/categories').then(response => {
            this.setState({
                info: response.data
            })
        })
    };

    render() {
        return (
            <div>
                <ul>
                {this.state.info.map((elm) => {
                    return <li>{elm.name}</li>
                    }
                )}
                </ul>
                <button onClick={this.category}>ボタン</button>
            </div>
        )
    }
}

ReactDOM.render(
    <Category />,
    document.getElementById('root')
);