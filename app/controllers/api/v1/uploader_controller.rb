module Api
  module V1
    class UploaderController < ApiController
      def thumb
        @file = Thumb.new file: params[:upload_file]
        if @file.save
          render json: {
            success: true,
            msg: "图片上传成功！",
            file_path: @file.file.url
          }
        else
          render json: {success: false, msg: '上传失败，请重试！'}
        end
      end
    end
  end
end