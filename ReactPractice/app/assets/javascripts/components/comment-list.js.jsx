class CommentList extends React.Component {

	makeComments(){
		return this.props.comments.map(function(comment){
			return(
				<li className="comment-li row">
					<div className="col-sm-2">
						<img src="https://placeholdit.imgix.net/~text?txtsize=33&txt=50%C3%9750&w=50&h=50"/>
					</div>
					<div className="col-sm-10">
						<span className="comment-text"><b>{comment.user} said:</b>&nbsp; {comment.content}</span>
						<br/>
						<a href="#">Like</a>
						<a href="#">Reply</a>
					</div>
				</li>
			)
		})
	}
	render(){
		return(
			<div className="comments-row row">
				<ul className="comment-list">
					{this.makeComments()}
				</ul>
			</div>
		)
	}
}