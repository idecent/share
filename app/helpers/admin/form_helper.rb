# encoding: utf-8
module Admin::FormHelper
  def bootstrap_text_field(label, model, field, value)
    html = <<-HTML
    <div class="clearfix">
      <label for="#{field}">#{label}：</label>
      <div class="input">
        <input type="text" size="15" name="#{model}[#{field}]" id="#{field}" class="xlarge" value="#{value}">
      </div>
    </div>
    HTML
    html.html_safe
  end

  def bootstrap_pwd_field(label, model, field)
    html = <<-HTML
    <div class="clearfix">
      <label for="#{field}">#{label}：</label>
      <div class="input">
        <input type="password" size="15" name="#{model}[#{field}]" id="#{field}" class="xlarge">
      </div>
    </div>
    HTML
    html.html_safe
  end

  def bootstrap_file_field(label, model, field)
    html = <<-HTML
    <div class="clearfix">
      <label for="#{field}">#{label}：</label>
      <div class="input">
        <input type="file" name="#{model}[#{field}]" id="#{field}" class="input-file">
      </div>
    </div>
    HTML
    html.html_safe
  end

  def bootstrap_text_area(label, model, field, value)
    html = <<-HTML
    <div class="clearfix">
      <label for="#{field}">#{label}：</label>
      <div class="input">
        <textarea name="#{model}[#{field}]" rows="3" id="#{field}" class="xxlarge">#{value}</textarea>
      </div>
    </div>
    HTML
    html.html_safe
  end

  def x_bootstrap_text_area(label, model, field, value)
    html = <<-HTML
    <div class="clearfix">
      <label for="#{field}">#{label}：</label>
      <div class="input">
        <textarea name="#{model}[#{field}]" rows="30" id="#{field}" class="x">#{value}</textarea>
      </div>
    </div>
    HTML
    html.html_safe
  end

  def bootstrap_submit_button
    html = <<-HTML
    <div class="actions">
      <input type="submit" value="确认" class="btn primary">&nbsp;<button class="btn" type="reset">清空</button>
    </div>
    HTML
    html.html_safe
  end

  def bootstrap_normal_button(id, value)
    html = <<-HTML
    <div class="actions">
      <button class="btn" id="#{id}">#{value}</button>
    </div>
    HTML
    html.html_safe
  end

  def bootstrap_option_select(label, model, field, value, loop_var, loop_val, loop_name)
    html = <<-HTML
    <div class="clearfix">
      <label for="normalSelect">#{label}：</label>
      <div class="input">
          <select id="normalSelect" name="#{model}[#{field}]">
              <option value="" #{raw 'selected="true"' if value.nil? || value == ''}>请选择</option>
              #{
              if loop_var.class.to_s == 'Hash'
                hash_loop_option(value, loop_var, loop_val, loop_name)
              else
                loop_option(value, loop_var, loop_val, loop_name)
              end
              }
          </select>
      </div>
    </div>
    HTML
    html.html_safe
  end

  def hash_loop_option(value, loop_var, loop_val, loop_name)
    html = ''
    loop_var.each do |key, val|
      html += "<option value=\"#{key}\"" + "#{'selected="true"' if value == key}" + ">" + "#{val}" + '</option>'
    end
    html.html_safe
  end

  def loop_option(value, loop_var, loop_val, loop_name)
    html = ''
    loop_var.each do |lv|
      html += "<option value=\"#{lv.attributes[loop_val]}\"" + "#{'selected="true"' if value == lv.attributes[loop_val]}" + ">" + "#{lv.attributes[loop_name]}" + '</option>'
    end
    html.html_safe
  end
end