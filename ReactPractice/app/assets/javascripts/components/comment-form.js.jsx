class CommentForm extends React.Component {
	constructor(){
		super();
		this.state = {
			content: ""
		}
	}

	updateContent(event){
		this.setState({content: event.target.value})
	}

	handleCommentSubmit(event){
		event.preventDefault();
		var newComment = this.state.content
		if (!newComment){
			return
		}
		this.props.onCommentAdd(newComment)
		this.setState({content: ""})
	}

	render(){
		return(
			<div className="comment-form">
				<form
					onSubmit={this.handleCommentSubmit.bind(this)}
					className="text-center comment-form">
					<input
					className="comment-input"
					type="text"
					placeholder="Enter your comment here"
					value={this.state.content}
					onChange={this.updateContent.bind(this)}
				/>
				</form>
			</div>

		)
	}
}