if params[:search].present?
    @memos = @memos.search(params[:search]).where(user_id: current_user.id)
  else
    @memos = Memo.where(user_id: current_user.id)
  end