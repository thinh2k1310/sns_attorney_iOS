//
//  AttorneyAPI.swift
//  Attorney
//
//  Created by Truong Thinh on 10/10/2022.
//

import Foundation
import Moya
import RxSwift

enum AttorneySNSAPI {
    // MARK: - Auth
    case loginOTP(loginOTPRequest: LoginRequest)
    case register(registerRequest: RegisterRequest)
    case validateEmail(validateEmailRequest: ValidateEmailRequest)
    case sendOTP(sendOTPRequest: SendOTPRequest)
    case resetPassword(resetPasswordRequest: ResetPasswordRequest)
    case fetchNewsFeed(request: PostsRequest)
    case fetchUserPost(request: UserPostsRequest)
    case getPostDetail(postId: String)
    case getPostComments(postId: String)
    case likePost(likeRequest: LikeRequest)
    case commentPost(commentRequest: CommentRequest)
    case editComment(editCmtRequest: EditCommentRequest)
    case deleteComment(commentId: String)
    case sendDefenceRequest(sendDefenceRequest: DefenceRequest)
    case createPost(createPostRequest: CreatePostRequest)
    case getDefenceRequest
    case acceptDefenceRequest(requestId: String)
    case denyDefenceRequest(requestId: String)
    case getAllCase
    case completeCase(caseId: String)
    case cancelCase(caseId: String)
    case getCaseDetail(caseId: String)
    case getProfile(userId: String)
    case changeAvatar(request: ChangeAvatarRequest)
    case changeCover(request: ChangeCoverRequest)
    case changePassword(request: ChangePasswordRequest)
    case getAttorney(request: ListAttorneyRequest)
    case postReview(request: ReviewRequest)
    case getAttorneyReview(attorneyId: String)
    case searchAll(request: SearchAllRequest)
    case searchUsers(request: SearchUsersRequest)
    case searchPosts(request: SearchPostsRequest)
    case getCaseComments(caseId: String)
    case commentCase(commentRequest: CaseCommentRequest)
    case deleteCaseComment(commentId: String)
    case editPost(editPostRequest: EditPostRequest)
    case deletePost(postId: String)
    case report(request: ReportRequest)
}

extension AttorneySNSAPI: TargetType {
    var baseURL: URL {
        let url = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String
        return URL(string: "http://localhost:3001/api")!
    }
    
    var path: String {
        switch self {
        case .loginOTP:
            return "auth/login"
        
        case .register:
            return "auth/register"
            
        case .validateEmail:
            return "auth/validate"
            
        case .sendOTP:
            return "auth/sendOTP"
            
        case .resetPassword:
            return "auth/password/reset"
            
        case .changePassword:
            return "auth/password/change"
            
        case .fetchNewsFeed:
            return "post/news"
            
        case .fetchUserPost:
            return "post/user"
        
        case .getPostDetail(let postId):
            return "post/\(postId)"
            
        case .getPostComments(let postId):
            return "post/\(postId)/comments"
            
        case .likePost:
            return "like"
            
        case .commentPost, .editComment:
            return "comment"
        
        case .deleteComment(let commentId):
            return "comment/\(commentId)"
        
        case .sendDefenceRequest:
            return  "case/request"
            
        case .createPost:
            return "post/create"
            
        case .getDefenceRequest:
            return "case/request"
        
        case .acceptDefenceRequest(let requestId):
            return "case/request/\(requestId)/accept"
            
        case .denyDefenceRequest(let requestId):
            return "case/request/\(requestId)/cancel"
            
        case .getAllCase:
            return "case/list"
            
        case .completeCase(let caseId):
            return "case/\(caseId)/complete"
        
        case .cancelCase(let caseId):
            return "case/\(caseId)/cancel"
            
        case .getCaseDetail(let caseId):
            return "case/\(caseId)"
            
        case .getProfile(let userId):
            return "user/\(userId)"
            
        case .changeAvatar:
            return "user/avatar"
            
        case .changeCover:
            return "user/cover"
            
        case .getAttorney:
            return "search/attorneys"
            
        case .postReview:
            return "review"
            
        case .getAttorneyReview(let attorneyId):
            return "review/\(attorneyId)"
            
        case .searchAll:
            return "search/all"
            
        case .searchUsers:
            return "search/users"
            
        case .searchPosts:
            return "search/posts"
            
        case .getCaseComments(let caseId):
            return "case/\(caseId)/comments"
            
        case .commentCase:
            return "caseComment"
        
        case .deleteCaseComment(let commentId):
            return "caseComment/\(commentId)"
            
        case .editPost:
            return "post"
            
        case .deletePost(let postId):
            return "post/\(postId)"
            
        case .report:
            return "reports"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .loginOTP, .register, .fetchNewsFeed, .likePost, .commentPost, .sendDefenceRequest, .createPost, .fetchUserPost, .getAttorney, .postReview, .searchAll, .searchUsers,.searchPosts, .commentCase, .report:
            return .post
        
        case .validateEmail, .sendOTP, .resetPassword, .acceptDefenceRequest, .completeCase, .cancelCase, .changeAvatar, .changeCover, .changePassword, .editComment, .editPost:
            return .put
            
        case .deleteComment, .denyDefenceRequest, .deleteCaseComment, .deletePost:
            return .delete
    
        default:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        return nil
    }

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .loginOTP(let loginOTPRequest):
            return .requestJSONEncodable(loginOTPRequest)
        case .register(let registerRequest):
            return .requestJSONEncodable(registerRequest)
        case .validateEmail(let validateEmailRequest):
            return .requestJSONEncodable(validateEmailRequest)
        case .sendOTP(let sendOTPRequest):
            return .requestJSONEncodable(sendOTPRequest)
        case .resetPassword(let resetPasswordRequest):
            return .requestJSONEncodable(resetPasswordRequest)
        case .fetchNewsFeed(let request):
            return .requestJSONEncodable(request)
        case .commentPost(let commentRequest):
            return .requestJSONEncodable(commentRequest)
        case .likePost(let likeRequest):
            return .requestJSONEncodable(likeRequest)
        case .sendDefenceRequest(let sendDefenceRequest):
            return .requestJSONEncodable(sendDefenceRequest)
        case .fetchUserPost(let request):
            return .requestJSONEncodable(request)
        case .changePassword(let request):
            return .requestJSONEncodable(request)
        case .getAttorney(let request):
            return .requestJSONEncodable(request)
        case .postReview(let request):
            return .requestJSONEncodable(request)
        case .searchAll(let request):
            return .requestJSONEncodable(request)
        case .searchUsers(let request):
            return .requestJSONEncodable(request)
        case .searchPosts(let request):
            return .requestJSONEncodable(request)
        case .commentCase(let commentRequest):
            return .requestJSONEncodable(commentRequest)
        case .editComment(let editCmtRequest):
            return .requestJSONEncodable(editCmtRequest)
        case .editPost(let editPostRequest):
            return .requestJSONEncodable(editPostRequest)
        case .report(let request):
            return .requestJSONEncodable(request)
            
        case .createPost(let request):
            var multidata = [
                MultipartFormData(provider: .data(request.content.data(using: String.Encoding.utf8, allowLossyConversion: false)!) , name :"content"),
                MultipartFormData(provider: .data(request.type.data(using: String.Encoding.utf8, allowLossyConversion: false)!), name :"type")
            ]
            if let media = request.media {
                guard let data = media.jpegData(compressionQuality: 1.0) else { return .requestPlain }
                multidata.append(MultipartFormData(provider: .data(data), name: "media", fileName: "photo.jpg", mimeType:"image/jpeg"))
            }
            return .uploadMultipart(multidata)
            
        case .changeAvatar(let request):
            var multidata : [MultipartFormData] = []
            if let media = request.media {
                guard let data = media.jpegData(compressionQuality: 1.0) else { return .requestPlain }
                multidata.append(MultipartFormData(provider: .data(data), name: "media", fileName: "photo.jpg", mimeType:"image/jpeg"))
            }
            return .uploadMultipart(multidata)
            
        case .changeCover(let request):
            var multidata : [MultipartFormData] = []
            if let media = request.media {
                guard let data = media.jpegData(compressionQuality: 1.0) else { return .requestPlain }
                multidata.append(MultipartFormData(provider: .data(data), name: "media", fileName: "photo.jpg", mimeType:"image/jpeg"))
            }
            return .uploadMultipart(multidata)

        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        var headersValue: [String: String] = [:]
        guard let token = UserService.shared.accessToken else { return headersValue }
        headersValue = ["Authorization" : "Bearer \(token)"]
        return headersValue
    }
    
    
}
