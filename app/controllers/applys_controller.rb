class ApplysController < ApplicationController
  def confirm
    @apply = Apply.new(apply_params)
    @store = Store.new(store_params)
    @project = Project.find(@apply.project)

    search = search_params  
    @search_id = search[:id]
    @search_name = search[:name]
    @link = search[:link]

    if @apply.valid? && @store.valid?
      @apply.avatar = @apply.avatar.original_filename
      @apply.file_path = @store.avatar.current_path
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => "../projects/show"
    end
  end

  def thanks
    # メール送信
   @apply = Apply.new(apply_params)
   ApplyMailer.received_email(@apply).deliver
   ApplyMailer.sended_email(@apply).deliver
   # 完了画面を表示
   render :action => 'thanks'
  end
end

private

 def apply_params
   params.require(:apply).permit(:name, :email, :birthdate, :sex, :project, :avatar, :file_path)
 end

 def store_params
   params.require(:apply).permit(:avatar)
 end

 def search_params
   params.require(:search).permit(:id, :name, :link)
 end
