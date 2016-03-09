class CommentBox extends React.Component {
	constructor(){
		super();
		this.state = {
			comments: [
				{user: "farazpatankar@gmail.com", content: "This is my first post!"},
				{user: "josh@jalexy.sexy", content: "This is personal site!"},
				{user: "anais@bgc.co", content: "I don't know what I am doing here!"}
			]
		}
	}

	addComment(userInput){
		var comment = { user: "Anonymous", content: userInput}
		var comments = this.state.comments
		comments.push(comment);
		this.setState({comments: comments})
	}


	render(){
		return(
			<div className="comment-wrapper">
				<CommentList comments={this.state.comments}/>
				<CommentForm onCommentAdd={this.addComment.bind(this)}/>
			</div>
		)
	}
}