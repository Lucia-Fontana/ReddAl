class UtenteStrategy < Strategy

  def call
    flash.alert = "Not allowed."
    redirect_to root_path
  end

end
