class ContactsController < ApplicationController

    def new
      @contact = Contact.new
    end
    def create
      upload_io = params[:contact][:picture]

      if !params[:contact][:picture].nil? && !params[:contact][:picture].original_filename.empty? && !Contact.exists?(picture: params[:contact][:picture].original_filename)
          File.open(Rails.root.join('public', 'uploads', upload_io.original_filename), 'w+b') do |file|
            file.write(upload_io.read)
          end
          params[:contact][:picture] = params[:contact][:picture].original_filename
      end

      @contact = Contact.new(contact_params)

      if @contact.save
        redirect_to @contact
      else
        render 'new'
      end
    end

    def show
      @contact = Contact.find(params[:id])
    end
    def index
      @contacts = Contact.all
    end


    private
      def contact_params
        params.require(:contact).permit(:firstname, :lastname, :phone_number, :street, :postal_code, :city, :country, :picture)
      end
end
