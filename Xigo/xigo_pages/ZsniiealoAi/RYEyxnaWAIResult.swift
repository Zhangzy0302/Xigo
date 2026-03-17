import SwiftUI

struct RYEyxnaWAIResult: View {
    // 输入参数
    let ryeuxjScence: String
    let ryeunaMethod: String
    let ruenDifficulty: String
    let raucActivityName: String
    
    // 状态管理
    @State private var aiwnxIsLoading: Bool = true
    @State private var generatedText: String = "" // 存储生成的结果
    @State private var errorMessage: String = ""  // 可选：存储错误信息
    
    @EnvironmentObject var ryeAisjNavi: UxzuaNaaviManer
    
    // 纯数据获取函数：只负责返回字符串，不操作 UI 状态
    func fetchResultData() async -> String {
        await xiwandelay(3) // 模拟网络请求时间
        
        // 模拟数据查找逻辑 (请确保 ryecanAiResult 在此作用域可见)
        // 假设 ryecanAiResult 是一个全局数组或单例
        let resultItem = ryecanAiResult.first {
            $0.rueyScene == ryeuxjScence && $0.reueyMethod == ryeunaMethod
        }
        
        if let item = resultItem {
            return item.result
        } else {
            return "No matching plan found for:\nScene: \(ryeuxjScence)\nMethod: \(ryeunaMethod)\nPlease try different parameters."
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            // 背景层
            GeometryReader { geo in
                Image("klahgw_main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
                    .ignoresSafeArea()
            }
            
            VStack {
                // 顶部导航栏
                IEyabZHskTopBar(iealkaTitle: "AI Customized ")
                
                GeometryReader { geo in
                    ZStack {
                        // 卡片背景形状
                        ZStack(alignment: .top) {
                            OAjdsaCneScreenShape(notchDepth: 30)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color.white,
                                            Color(red: 1.0, green: 0.92, blue: 0.96)
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .shadow(radius: 10)
                            
                            // 顶部拖拽条
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white)
                                .frame(width: 56, height: 4)
                                .shadow(color: .black.opacity(0.25), radius: 4, y: 2)
                        }
                        .frame(maxHeight: .infinity)
                        
                        // 内容区域
                        VStack(spacing: 0) {
                            Text("AI-generated results")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .extraBold))
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                                .padding(.top, 40)
                            
                            VStack {
                                if aiwnxIsLoading {
                                    // 加载状态 UI
                                    VStack(spacing: 22) {
                                        ProgressView()
                                            .progressViewStyle(.circular)
                                            .scaleEffect(1.4)
                                            .tint(.black)
                                        
                                        Text("AI Generating...")
                                            .foregroundColor(.black)
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                    }
                                    .frame(width: 140, height: 140)
                                } else {
                                    // 结果展示 UI
                                    ScrollView {
                                        if generatedText.isEmpty {
                                            Text("No content generated.")
                                                .foregroundColor(.gray)
                                                .padding()
                                        } else {
                                            Text("\(raucActivityName): \(generatedText)")
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                                .lineSpacing(10)
                                                .foregroundColor(.black)
                                                .textSelection(.enabled) // 允许复制
                                                .padding(.bottom, 20)
                                        }
                                    }
                                }
                                
                                Spacer(minLength: 20)
                                
                                // 底部确认按钮
                                Button(action: {
                                    ryeAisjNavi.popToRoot()
                                }) {
                                    Text("Confirm")
                                        .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .semiBold))
                                        .foregroundColor(.white)
                                        .frame(width: 144, height: 50)
                                        .background(Color.black)
                                        .cornerRadius(10)
                                }.padding(.vertical, 16)
                            }
                            .padding(.horizontal, 14)
                            .padding(.top, 16)
                            .padding(.bottom, 20)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                            )
                            .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                            .padding(.horizontal, 20)
                        }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
            }
            
            .padding(.top, 10)
        }
        .navigationBarHidden(true)
        .background(XiwanEnableSwipeBack())
        .task {
            // 视图出现时自动触发数据加载
            if aiwnxIsLoading {
                let result = await fetchResultData()
                generatedText = result
                aiwnxIsLoading = false
            }
        }
    }
}

// 可选：简单的按钮点击缩放样式
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

let ryecanAiResult: [RYeuanResult] = [
    RYeuanResult(rueyScene: "Indoor", reueyMethod: "Social contact", result:"""
    This cosplay event proposal describes a beginner-friendly indoor social gathering designed to help participants connect and share their interest in cosplay in a relaxed and welcoming environment. The event takes place in an indoor venue such as a community hall, activity room, or themed café space where attendees can comfortably interact, showcase their costumes, and meet others who enjoy anime, games, and comic culture. The main goal of the event is to encourage social contact among cosplayers, especially beginners who may be new to participating in community activities. During the event, participants arrive wearing their costumes and are welcomed by the host, who briefly introduces the purpose of the gathering and invites everyone to share the character they are portraying. After the introduction, attendees are encouraged to walk around the venue, talk with each other, exchange ideas about costume design, makeup techniques, and character interpretation, and build new friendships through casual conversation. A small photo area with a themed backdrop is prepared so that participants can take pictures individually or with others, creating memorable moments while practicing poses and character expressions. Some attendees may also choose to briefly present their characters, explain the inspiration behind their costumes, or perform simple in-character poses, which adds a fun and interactive element to the event without putting pressure on beginners. Throughout the gathering, the atmosphere remains friendly and informal, allowing everyone to freely participate at their own comfort level while respecting community guidelines such as asking permission before taking close-up photos and maintaining a supportive environment. By the end of the event, participants not only have the opportunity to capture photos and share their creativity but also to expand their social circles within the cosplay community, gain confidence in presenting their costumes, and experience the joy of connecting with others who share the same passion.
    """),
    RYeuanResult(rueyScene: "Indoor", reueyMethod: "Relax", result:"""
    This cosplay event proposal describes a beginner-friendly indoor activity designed to provide participants with a relaxing and comfortable environment where they can enjoy cosplay without pressure or competition. The event takes place in an indoor venue such as a community activity room, lounge space, or themed café where attendees can gather in costume and spend time unwinding while appreciating cosplay culture. The main purpose of the event is to allow participants to relax, socialize naturally, and enjoy the creative atmosphere of cosplay in a calm setting. When guests arrive, they are welcomed into a softly decorated space with comfortable seating, light music, and themed decorations inspired by popular anime, games, or fantasy worlds. Participants are encouraged to wear their favorite cosplay outfits or casual cosplay-inspired clothing and simply enjoy the atmosphere. Instead of structured performances or contests, the event focuses on relaxed activities such as casual conversation, costume appreciation, light character role-play, and taking photos in a small themed corner prepared for simple photography. Attendees can sit together, share stories about how they created their costumes, discuss favorite characters, exchange cosplay tips, or quietly enjoy drinks and snacks while interacting with others who share similar interests. Some participants may choose to pose for relaxed photos or recreate simple character moments with friends, while others may simply observe and enjoy the creative environment. Because the difficulty level is primary, the event avoids complicated schedules or demanding activities, ensuring that even first-time cosplayers feel comfortable participating. The atmosphere emphasizes friendliness, respect, and enjoyment, encouraging everyone to interact at their own pace and feel welcomed within the community. By the end of the event, participants leave feeling relaxed, inspired by other cosplayers’ creativity, and more connected to the cosplay community, having spent an enjoyable and low-pressure afternoon immersed in a shared hobby.
    """),
    RYeuanResult(rueyScene: "Outdoor", reueyMethod: "Social contact", result:"""
    This cosplay event proposal describes an outdoor social gathering designed to bring cosplay enthusiasts together in a lively and open environment where participants can interact, share their creativity, and build connections through cosplay culture. The event takes place in an outdoor setting such as a public park, botanical garden, or scenic plaza where there is plenty of open space for movement, photos, and casual conversation. Participants are invited to arrive in cosplay outfits representing characters from anime, games, comics, or movies, creating a colorful and immersive atmosphere. Once the event begins, attendees are encouraged to walk around the area, introduce themselves to others, and talk about their characters, costume design, and favorite series, making the gathering feel friendly and welcoming even for newcomers. Small interactive activities can naturally emerge during the event, such as group photos, character pose exchanges, or casual role-play conversations between different characters. Because the event is outdoors, the environment also allows participants to explore different scenic spots for photography, collaborate with other cosplayers for themed photo sets, and enjoy the natural surroundings while engaging socially. Organizers can also encourage participants to join informal meetups for specific fandoms or character groups, helping people with similar interests connect more easily. Throughout the event, the focus remains on relaxed social contact, where people are free to participate at their own pace, make new friends, and enjoy the shared excitement of cosplay in a public and energetic setting. By the end of the gathering, participants not only leave with memorable photos and experiences but also with stronger connections within the cosplay community, having spent time outdoors celebrating creativity, fandom, and social interaction together.
    """),
    RYeuanResult(rueyScene: "Outdoor", reueyMethod: "Relax", result:"""
    This cosplay event proposal describes a relaxing outdoor gathering designed to provide cosplayers with a calm and enjoyable environment where they can appreciate their hobby without pressure or structured activities. The event is held in a scenic outdoor location such as a park, garden, or riverside area, offering open space for participants to sit, stroll, and enjoy the surroundings while in cosplay. Attendees are encouraged to come dressed as their favorite characters, whether elaborate costumes or simple cosplay-inspired outfits, creating a colorful and visually engaging atmosphere that blends naturally with the outdoor setting. The focus of the event is on relaxation, allowing participants to wander the area at their own pace, engage in quiet conversation, or simply enjoy the scenery while sharing their cosplay experience with others in a low-pressure environment. Gentle activities, such as casual group photos, character-themed picnics, or quiet sketching and journaling in costume, provide ways for attendees to engage without structured competition or strict schedules. Organizers may set up small shaded areas with seating, light refreshments, or scenic photo spots to enhance comfort and encourage lingering in the space. Throughout the event, the atmosphere emphasizes friendliness, inclusivity, and freedom, enabling cosplayers of all experience levels to feel welcomed and comfortable. By the end of the gathering, participants leave with a sense of relaxation, inspiration from seeing other costumes, and an enhanced connection to the cosplay community, having spent a peaceful and enjoyable day outdoors celebrating creativity and fandom.
    """),
]

struct RYeuanResult {
    let rueyScene: String
    let reueyMethod: String
    let result: String
}
