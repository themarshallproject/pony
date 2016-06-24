class MergeTag
  def self.recognize(text)
    re = /\*\|([A-Z_0-9:]+)\|\*/

    # the first capture group is the tag name, so &:first unwraps `[val]` to `val`
    text.scan(re).map(&:first).uniq
  end
end
