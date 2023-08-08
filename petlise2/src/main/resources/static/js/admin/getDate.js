function getDate (data) {
  const date = new Date(data)
  const yyyy = date.getFullYear()
  const mm = date.getMonth() + 1
  const dd = date.getDate()

  return `${yyyy}. ${String(mm).padStart(2, '0')}. ${String(dd).padStart(2, '0')}`
}

function getDay (data) {
  const date = new Date(data)

  const mm = date.getMonth() + 1
  const dd = date.getDate()

  return `${String(mm).padStart(2, '0')}. ${String(dd).padStart(2, '0')}`
}