class DownloadsController < ApplicationController
    def assignment
        sclass = Sclass.find(params[:id])
        send_data sclass.assignments, filename: 'assignment.pdf', type: 'application/pdf'
      end
end
