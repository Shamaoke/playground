
fn main() {

  let ss = "ok! ok too! ok three!";

  let ss_ptr = ss.as_ptr();

  let ss_addr = ss_ptr.addr();
  let ss_len  = ss.len();
  let ss_data = unsafe {
    let ss_slice_bytes = std::slice::from_raw_parts(ss_ptr, ss_len);
    let ss_slice_bytes_slice = &ss_slice_bytes[..3];
    // str::from_utf8(ss_slice_bytes_slice).expect("Invalid UTF-8 data")
    str::from_utf8(ss_slice_bytes_slice).unwrap()
  };

  let ss_data_slice_1 = unsafe { *ss_ptr };
  let ss_data_slice_2 = unsafe { *ss_ptr.add(1) };
  let ss_data_slice_3 = unsafe { *ss_ptr.add(2) };

  let ss_data_slice_bytes = &[ss_data_slice_1, ss_data_slice_2, ss_data_slice_3];

  let ss_data_slice = str::from_utf8(ss_data_slice_bytes).unwrap();

  println!("addr: {0:#x}\nlen: {1}\ndata: {2}\ndata_slice: {3}", ss_addr, ss_len, ss_data, ss_data_slice);
}

