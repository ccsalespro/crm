LeadsController.class_eval do

  # Promote just sits in original version. Instead redirect to new account

  def promote
    @users = User.except(@current_user)
    @account, @opportunity, @contact = @lead.promote(params)
    @accounts = Account.my.order('name')
    @stage = Setting.unroll(:opportunity_stage)

    if @account.errors.empty? && @opportunity.errors.empty? && @contact.errors.empty?
      @lead.convert
      redirect_to @account
    else
      respond_with(@lead) do |format|
        format.json { render :json => @account.errors + @opportunity.errors + @contact.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @account.errors + @opportunity.errors + @contact.errors, :status => :unprocessable_entity }
      end
    end
  end
end
