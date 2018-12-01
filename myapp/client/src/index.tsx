import * as React from "react";
import * as ReactDOM from "react-dom";
import axios from "axios";

class Category extends React.Component<any, any> {
    constructor(props) {
        super(props);
        this.state = {
            info: [],
            ret: {}
        }
    }

    category = () => {
        axios.get('/api/v1/categories').then(response => {
            this.setState({
                info: response.data
            })
        })
    };

    category_post = () => {
        var params = new URLSearchParams();
        //var date = new Date();
        //params.append("category[name]", "test "+date.getTime());
        params.append("category[name]", "test-test");
        axios.post('/api/v1/categories', params).then(response => {
            this.setState({
                ret: response.data
            })
        })
    };

    render() {
        return (
            <div>
                <button onClick={this.category}>カテゴリ閲覧</button>
                <br/>
                <button onClick={this.category_post}>カテゴリ投稿</button>
                <ul>
                    {this.state.info.map((elm) => {
                            return <li>{elm.name}</li>
                        }
                    )}
                </ul>
                {this.state.ret.name}
            </div>
        )
    }
}

ReactDOM.render(
    <Category />,
    document.getElementById('root')
);