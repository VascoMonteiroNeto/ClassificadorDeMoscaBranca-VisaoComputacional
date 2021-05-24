function [novaCoordenada] = recalculaCoordenada(coordenadaOri, oriAngle, img)

    xy=[coordenadaOri(2);coordenadaOri(1)];

%     oriAngle=360-oriAngle;
    RotMatrix = [cosd(oriAngle) -sind(oriAngle); sind(oriAngle) cosd(oriAngle)];
    ITemp = imrotate(img, oriAngle);
    
    ImCenterA = (size(img)/2)';
    ImCenterA = [ImCenterA(1);ImCenterA(2)];
    ImCenterB = (size(ITemp)/2)';
    ImCenterB = [ImCenterB(1);ImCenterB(2)];
    
    novaCoordenada = RotMatrix*(xy-ImCenterA)+ImCenterB;

end