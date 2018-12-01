import * as React from "react";
import * as ReactDOM from "react-dom";
import axios from "axios";

class Category extends React.Component<any, any> {
    constructor(props) {
        super(props);
        this.state = {
            text: ''
        }
    }

    category = () => {
        axios.get('/api/v1/categories/1').then(response => {
            this.setState({
                text: response.data.name
            })
        })
    };

    render() {
        return (
            <div>
                {this.state.text}
                <br />
                <button onClick={this.category}>ボタン</button>
            </div>
        )
    }
}

ReactDOM.render(
    <Category />,
    document.getElementById('root')
);