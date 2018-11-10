module ApplicationHelper
    def full_title(page_title = "")
        base_title = "task"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end

    def get_image(path)
        path.present? ? path : asset_path('no-image.png')
    end
end
