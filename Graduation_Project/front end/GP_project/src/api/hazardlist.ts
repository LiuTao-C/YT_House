import request from "@/utils/request";

//定义类型
export type Common<T> = {
  count: string;
  code: string;
  data: T;
  mesg: string;
};
export type hazardItem = {
  id: number;
  hazardLevel: string;
  location: string;
  period: string;
  findDate: string;
  detailInfo: string;
  registor: string;
};

export const getHazardlist = (page: number) => {
  return request<{
    code: number;
    count: number;
    msg: string;
    data: hazardItem[];
  }>({
    method: "GET",
    url: `/hazardlog/list?page=${page}&size=10`,
  });
};

export const getHazardById = (id: String) => {
  return request<{ code: number; msg: string; data: hazardItem }>({
    method: "GET",
    url: `/hazardlog/${id}`,
    params: {
      id,
    },
  });
};

export const saveOrUpdateHazard = (hazardinfo: hazardItem) => {
  return request<{
    code: number;
    count: number;
    mag: string;
    data: hazardItem[];
  }>({
    method: "PUT",
    url: "/hazardlog/",
    data: hazardinfo,
  });
};

export const deleteHazard = (id: number) => {
  return request<{ code: number; msg: string; data: hazardItem[] }>({
    method: "DELETE",
    url: `/hazardlog/${id}`,
  });
};
